# Publications Page Spec

## Goal

Add a dedicated `Publications` page to the personal homepage so visitors can browse the full publication list without making the homepage significantly longer or more complex.

## Constraints

- Keep the homepage structure unchanged at a high level.
- Preserve the existing `Selected Publications` section on the homepage.
- Use a standard academic publication list format.
- Reuse the existing `papers` collection instead of duplicating content.

## User-Facing Requirements

- The site navigation must include a `Publications` link that opens a dedicated page.
- The new page must list all entries from `site.papers`, not only featured ones.
- Each publication entry should show:
  - title
  - authors
  - venue
  - year
  - relevant links such as `arXiv`, `PDF`, `Link`, and `Details` when available
- The page should be readable and consistent with the current site styling.

## Non-Goals

- Do not redesign the homepage layout.
- Do not add filtering, search, or tabs.
- Do not rewrite all paper metadata unless required for rendering.

## Implementation Notes

- Add a dedicated page at `/publications/`.
- Update the shared site navigation in `_layouts/layout.html`.
- Create or reuse a publication-list rendering pattern suitable for the full list page.
- Extend the regression script so it verifies both homepage navigation and the generated publications page.
