create table public.product_images (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  image_url text not null,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);
create index product_images_product_idx on public.product_images(product_id,sort_order,created_at);
alter table public.product_images enable row level security;
grant select on public.product_images to anon,authenticated;
grant insert,update,delete on public.product_images to authenticated;
create policy product_images_public_published on public.product_images for select to anon,authenticated
  using (exists(select 1 from public.products p where p.id=product_id and p.published));
create policy product_images_admin on public.product_images for all to authenticated
  using (exists(select 1 from public.catalog_admins a where a.user_id=(select auth.uid())))
  with check (exists(select 1 from public.catalog_admins a where a.user_id=(select auth.uid())));
insert into public.product_images(product_id,image_url,sort_order)
  select id,image_url,0 from public.products where image_url is not null and btrim(image_url)<>'';
