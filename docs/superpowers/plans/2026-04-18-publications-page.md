# Publications Page Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a dedicated `Publications` page that lists the full paper collection while keeping the homepage concise.

**Architecture:** Keep the homepage `Selected Publications` include unchanged in purpose, add a new standalone `/publications/` page backed by `site.papers`, and update the shared navigation so visitors can move between the homepage and the complete publication list. Extend the shell regression test to verify both the homepage link and the generated publications page content.

**Tech Stack:** Jekyll, Liquid templates, Markdown front matter, shell-based regression checks

---

## Chunk 1: Regression Coverage

### Task 1: Add failing coverage for the dedicated publications page

**Files:**
- Modify: `scripts/test_homepage_structure.sh`

- [ ] **Step 1: Write the failing test**

Add assertions that:
- the generated homepage contains a link to `/publications/`
- the generated site contains `/publications/index.html`
- the publications page contains the `Publications` heading
- the publications page contains at least one paper title from the collection

- [ ] **Step 2: Run test to verify it fails**

Run: `bash scripts/test_homepage_structure.sh`
Expected: FAIL because the dedicated publications page does not exist yet.

## Chunk 2: Publications Page

### Task 2: Add a full publications page

**Files:**
- Create: `publications.md`

- [ ] **Step 1: Create the page front matter and content**

Render a dedicated page at `/publications/` with a top-level `Publications` heading and a standard academic list based on `site.papers | sort: "date" | reverse`.

- [ ] **Step 2: Keep the list simple and scan-friendly**

Each entry should show title, authors, venue, year, and available links.

### Task 3: Wire navigation to the new page

**Files:**
- Modify: `_layouts/layout.html`

- [ ] **Step 1: Update the shared navigation**

Change the `Publications` item from a homepage anchor to `/publications/`.

## Chunk 3: Verification

### Task 4: Verify end-to-end

**Files:**
- Test: `scripts/test_homepage_structure.sh`

- [ ] **Step 1: Run the regression script**

Run: `bash scripts/test_homepage_structure.sh`
Expected: PASS

- [ ] **Step 2: Run a clean Jekyll build**

Run: `bundle exec jekyll clean && bundle exec jekyll build`
Expected: exit code 0
