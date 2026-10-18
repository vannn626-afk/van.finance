-- Jalankan seluruh SQL ini di Supabase SQL Editor.
create table if not exists public.finance_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  kind text not null check (kind in ('transaction','goal','wishlist')),
  title text not null,
  amount numeric(14,2) not null default 0 check (amount >= 0),
  category text not null default 'Lainnya',
  item_date date not null default current_date,
  note text not null default '',
  image_url text not null default '',
  target_date date,
  saved_amount numeric(14,2) not null default 0 check (saved_amount >= 0),
  is_done boolean not null default false,
  created_at timestamptz not null default now()
);
create index if not exists finance_items_user_kind_idx on public.finance_items(user_id, kind);
alter table public.finance_items enable row level security;
drop policy if exists "Users read own finance items" on public.finance_items;
drop policy if exists "Users insert own finance items" on public.finance_items;
drop policy if exists "Users update own finance items" on public.finance_items;
drop policy if exists "Users delete own finance items" on public.finance_items;
create policy "Users read own finance items" on public.finance_items for select to authenticated using (auth.uid() = user_id);
create policy "Users insert own finance items" on public.finance_items for insert to authenticated with check (auth.uid() = user_id);
create policy "Users update own finance items" on public.finance_items for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users delete own finance items" on public.finance_items for delete to authenticated using (auth.uid() = user_id);
