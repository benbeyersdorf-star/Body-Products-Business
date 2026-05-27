-- Run this in your Supabase SQL editor
-- Go to: supabase.com → your project → SQL Editor → New Query → paste this → Run

create table if not exists ingredients (
  id bigint generated always as identity primary key,
  name text not null,
  unit text not null default 'oz',
  cost numeric(10,4) not null default 0,
  created_at timestamptz default now()
);

create table if not exists recipes (
  id bigint generated always as identity primary key,
  name text not null,
  items jsonb not null default '[]',
  batch_units numeric(10,2) default 12,
  labor_mins numeric(10,2) default 60,
  hourly_rate numeric(10,2) default 20,
  markup numeric(10,2) default 2.5,
  platform_fee numeric(10,2) default 8,
  cost_per_unit numeric(10,4),
  online_price numeric(10,4),
  profit_per_unit numeric(10,4),
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Allow public read/write (single shared account, no auth)
alter table ingredients enable row level security;
alter table recipes enable row level security;

create policy "Public read ingredients" on ingredients for select using (true);
create policy "Public insert ingredients" on ingredients for insert with check (true);
create policy "Public update ingredients" on ingredients for update using (true);
create policy "Public delete ingredients" on ingredients for delete using (true);

create policy "Public read recipes" on recipes for select using (true);
create policy "Public insert recipes" on recipes for insert with check (true);
create policy "Public update recipes" on recipes for update using (true);
create policy "Public delete recipes" on recipes for delete using (true);

-- Seed default ingredients (your real costs)
insert into ingredients (name, unit, cost) values
  ('Beef tallow (rendered)', 'oz',   0.356),
  ('Vitamin E oil',          'tsp',  0.625),
  ('Lye (NaOH)',             'oz',   0.31),
  ('Moisturizer jar (2oz)',  'each', 2.00),
  ('Kraft wrap + label',     'each', 0.40),
  ('Printed label',          'each', 0.25),
  ('Essential oil',          'drop', 0.025),
  ('Olive oil',              'oz',   0.22),
  ('Coconut oil',            'oz',   0.18),
  ('Beeswax',                'oz',   0.45),
  ('Lavender EO',            'drop', 0.035),
  ('Frankincense EO',        'drop', 0.08);
