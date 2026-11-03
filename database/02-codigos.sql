-- Códigos visíveis no painel e nas consultas de peças publicadas.
create table public.product_codes (
  product_id uuid primary key references public.products(id) on delete cascade,
  code text not null check (length(btrim(code)) > 0)
);
alter table public.product_codes enable row level security;
grant select on public.product_codes to anon, authenticated;
grant insert, update, delete on public.product_codes to authenticated;
create policy product_codes_admin on public.product_codes for all to authenticated
  using (exists (select 1 from public.catalog_admins a where a.user_id=(select auth.uid())))
  with check (exists (select 1 from public.catalog_admins a where a.user_id=(select auth.uid())));
create policy product_codes_public_published on public.product_codes for select to anon, authenticated
  using (exists (select 1 from public.products p where p.id=product_id and p.published));
