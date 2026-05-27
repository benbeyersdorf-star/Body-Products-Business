-- Run this in your Supabase SQL Editor
-- Go to: supabase.com → your project → SQL Editor → New Query → paste → Run

-- Sales tracker
create table if not exists sales (
  id bigint generated always as identity primary key,
  recipe_id bigint references recipes(id) on delete set null,
  product_name text not null,
  quantity integer not null default 1,
  sale_price numeric(10,2) not null,
  cost_per_unit numeric(10,4) default 0,
  channel text default 'Etsy',
  note text,
  sold_at timestamptz default now(),
  created_at timestamptz default now()
);

-- Cure date tracker
create table if not exists soap_batches (
  id bigint generated always as identity primary key,
  name text not null,
  recipe_id bigint references recipes(id) on delete set null,
  batch_size integer not null default 1,
  made_at date not null default current_date,
  cure_days integer not null default 28,
  ready_at date generated always as (made_at + cure_days) stored,
  notes text,
  sold_out boolean default false,
  created_at timestamptz default now()
);

-- Inventory
create table if not exists inventory (
  id bigint generated always as identity primary key,
  name text not null,
  recipe_id bigint references recipes(id) on delete set null,
  units_on_hand integer not null default 0,
  low_stock_threshold integer not null default 5,
  unit_cost numeric(10,4) default 0,
  updated_at timestamptz default now(),
  created_at timestamptz default now()
);

-- RLS policies
alter table sales enable row level security;
alter table soap_batches enable row level security;
alter table inventory enable row level security;

create policy "Public all sales" on sales for all using (true) with check (true);
create policy "Public all soap_batches" on soap_batches for all using (true) with check (true);
create policy "Public all inventory" on inventory for all using (true) with check (true);
