insert into public.categories(name) values ('Motor') on conflict (name) do nothing;
