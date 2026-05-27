# Tallow Recipe Cost Calculator

A web app for building recipes, pricing ingredients, and calculating profit margins. Recipes save to Supabase so they're available on any device.

---

## Deploy in 4 steps

### Step 1 — Supabase (database)

1. Go to [supabase.com](https://supabase.com) and create a free account + new project
2. Once your project loads, go to **SQL Editor → New Query**
3. Paste the contents of `schema.sql` and click **Run**
4. Go to **Project Settings → API** and copy:
   - **Project URL** (looks like `https://abcdefgh.supabase.co`)
   - **Anon public key** (starts with `eyJh...`)

### Step 2 — Add credentials to index.html

Open `index.html` and find these two lines near the top of the `<script>` section:

```js
const SUPABASE_URL = '';   // paste your Project URL here
const SUPABASE_KEY = '';   // paste your anon key here
```

Paste your values inside the quotes. Example:

```js
const SUPABASE_URL = 'https://abcdefgh.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

Save the file.

### Step 3 — GitHub (push the files)

```bash
# Create a new repo on github.com, then:
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/tallow-calculator.git
git push -u origin main
```

Or just drag and drop the two files into a new repo on github.com.

### Step 4 — Vercel (deploy)

1. Go to [vercel.com](https://vercel.com) and log in with GitHub
2. Click **Add New Project**
3. Import your `tallow-calculator` repo
4. Leave all settings as default and click **Deploy**
5. Vercel gives you a URL like `tallow-calculator.vercel.app` — that's it!

---

## Usage

- **Ingredient Library** — add/edit ingredients and their costs. Changes save instantly.
- **Recipe Builder** — pick ingredients, enter quantities, set batch size and labor. Hit **Save** to store it.
- **Saved Recipes** — accessible from any device. Click Load to pull a recipe back into the builder.
- **Cost Breakdown** — live cost per unit, online price, profit, and full batch totals.

## Files

| File | Purpose |
|------|---------|
| `index.html` | The full app — HTML, CSS, and JS in one file |
| `schema.sql` | Run this once in Supabase to create the tables |
| `README.md` | This file |
