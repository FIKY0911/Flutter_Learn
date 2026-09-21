---
name: Warung Modern UI
colors:
  surface: '#fcf9f2'
  surface-dim: '#dcdad3'
  surface-bright: '#fcf9f2'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f6f3ec'
  surface-container: '#f0eee7'
  surface-container-high: '#ebe8e1'
  surface-container-highest: '#e5e2db'
  on-surface: '#1c1c18'
  on-surface-variant: '#5a4138'
  inverse-surface: '#31312c'
  inverse-on-surface: '#f3f0e9'
  outline: '#8f7066'
  outline-variant: '#e3bfb2'
  surface-tint: '#a83900'
  primary: '#a43700'
  on-primary: '#ffffff'
  primary-container: '#cd4700'
  on-primary-container: '#fffbff'
  inverse-primary: '#ffb59a'
  secondary: '#1b6d24'
  on-secondary: '#ffffff'
  secondary-container: '#a0f399'
  on-secondary-container: '#217128'
  tertiary: '#924700'
  on-tertiary: '#ffffff'
  tertiary-container: '#b75b00'
  on-tertiary-container: '#fffbff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdbcf'
  primary-fixed-dim: '#ffb59a'
  on-primary-fixed: '#380d00'
  on-primary-fixed-variant: '#802a00'
  secondary-fixed: '#a3f69c'
  secondary-fixed-dim: '#88d982'
  on-secondary-fixed: '#002204'
  on-secondary-fixed-variant: '#005312'
  tertiary-fixed: '#ffdcc6'
  tertiary-fixed-dim: '#ffb786'
  on-tertiary-fixed: '#311300'
  on-tertiary-fixed-variant: '#723600'
  background: '#fcf9f2'
  on-background: '#1c1c18'
  surface-variant: '#e5e2db'
typography:
  display-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  title-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  title-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 22px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '700'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 10px
    fontWeight: '700'
    lineHeight: 14px
    letterSpacing: 0.04em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system translates traditional Indonesian warung hospitality into an accessible, tactile, and appetizing mobile catalog experience. It fuses contemporary Material Design 3 structures with a culinary-rooted identity: warm, generous, transparent, and direct.

### Key Tenets
- **Appetite-Forward Warmth:** Clean layouts dominated by toasted spice undertones, avoiding the sterile white backgrounds of standard commerce tools in favor of comforting culinary neutrals.
- **Street-Level Accessibility:** High-contrast text, clear pricing hierarchy, and tactile buttons designed for one-handed operation on mid-range mobile devices.
- **Tactile Authenticity:** Softly structured surfaces that elevate imagery of traditional fare (sambal, fried shallots, pandan leaves) without distracting ornamentation.

## Colors

The color system is calibrated for high sunlight legibility and sensory warmth.

- **Primary (`#E65100` / `#F57C00`):** Sambal and turmeric-inspired warm orange/amber. Used for primary calls-to-action, active tab bars, critical counters, and hero highlights.
- **Secondary (`#2E7D32` / `#4CAF50`):** Fresh herb and banana leaf green. Reserved specifically for pricing indicators (e.g., `Rp 18.000`), "Tersedia" (in-stock) tags, and dietary badges.
- **Neutral Surface Canvas (`#FFFDF9` to `#F8F5EE`):** Steamed rice and coconut cream tones. Replaces cold stark grays to keep the eating experience welcoming and soft on the eyes.
- **Neutral Typography (`#1F2937` & `#374151`):** Deep charcoal and warm slate. Ensures AAA accessibility against creamy backgrounds without harsh true black.
- **Surface Tiers:**
  - Background: `#FFFDF9`
  - Container Low: `#F8F5EE`
  - Container High: `#EFE9DC`
  - Outline / Divider: `#E3DAC9`

## Typography

The type system relies on **Plus Jakarta Sans**, an Indonesian-crafted typeface pairing geometric utility with subtle rounded warmth.

### Hierarchy & Content Rules
- **Display & Headline:** Used for Warung brand identity, promo titles, and dish names in detail sheets.
- **Price Treatment:** Indonesian Rupiah amounts must strictly use `title-lg` or `title-md` with `fontWeight: 700`, styled in secondary herb green (`#2E7D32`), with consistent space formatting (e.g., `Rp 15.000`, not `Rp.15000` or `IDR 15k`).
- **Category Badges & Status:** Rendered in `label-sm` or `label-md` with uppercase transformation and slight tracking (`+0.04em`) to maintain legibility at tiny scale.

## Layout & Spacing

A strict mobile-first 4-column fluid layout that stretches across viewports while capping content containers at `480px` on wider screens or tablets to preserve handheld density.

### Spacing Guidelines
- **Outer Page Margin:** Fixed `1rem` (16px) margin on mobile edges, stepping to `1.5rem` (24px) for screens >600px.
- **Grid Gutter:** `1rem` (16px) separation between food menu cards in dual-column grids.
- **Bottom Clearance:** A reserved bottom inset of `5rem` (80px) to accommodate sticky checkout actions and floating order summaries without occluding list items.

## Elevation & Depth

Visual hierarchy uses warm ambient shadows paired with soft container fills, avoiding cold charcoal drops.

- **Level 0 (Canvas):** Flat `#FFFDF9`. Used for primary scroll views.
- **Level 1 (Card & List Tile):** `#FFFFFF` surface resting on `#FFFDF9` with an ambient warm drop: `0px 2px 8px rgba(110, 60, 10, 0.06)` and a subtle `1px` border of `#E3DAC9`.
- **Level 2 (Chips & Search Bar):** `#FFFFFF` elevated with `0px 4px 12px rgba(110, 60, 10, 0.08)`.
- **Level 3 (Floating Action & Sticky Bar):** `#FFFFFF` with `0px -4px 16px rgba(46, 30, 15, 0.10)` for bottom sheets and checkout bars.
- **Active / Pressed State:** Elevation collapses to Level 0 with a `0.98` scale transition.

## Shapes

The interface embraces a rounded, organic language that complements food imagery.

- **Menu Cards & Bottom Sheets:** `rounded-lg` (16px / 1rem) for an inviting and modern physical card presence.
- **Pills & Filter Chips:** Full capsule radius (`9999px`) for quick touch feedback and smooth horizontal thumb scrolling.
- **Input Fields & Buttons:** `12px` to `16px` curvature providing substantial touch targets (minimum 48px height).

## Components

### 1. App Bar (Flutter-Inspired)
- Sticky top navigation with creamy background (`#FFFDF9`) and 0 elevation until scrolled.
- Contains the Warung title, branch selector, and persistent search icon. Transitions to elevated state (Level 1) upon vertical scroll.

### 2. Food & Category Chips
- Horizontally scrollable row with sticky "Semua" pill.
- Default: `#F8F5EE` background, `#374151` label, no border.
- Selected: `#E65100` background, white label, with bold label weight.
- Category identifiers: "Makanan", "Minuman", "Camilan", "Paket Hemat".

### 3. Food Catalog Cards
- **Structure:** Vertical card (16px radius) housing a 4:3 cropped dish photograph, category badge overlay (top-left), title (`title-md`), description snippet (`body-sm`), and a bottom row pairing the green price tag (`Rp XX.XXX`) with an orange "+" add button.
- **Sold Out State ("Habis"):** 50% opacity overall, secondary action replaced by a disabled gray label "Habis".

### 4. Buttons & Floating Actions
- **Primary Action (Add to Order / Pesan):** `#E65100` background, white text, 48px height, 12px radius, bold label.
- **Sticky Bottom Summary Bar:** Pinned to bottom-safe area. Left side contains order quantity counter and total price (`#2E7D32`), right side contains a wide primary CTA button.

### 5. Selection Controls (Checkboxes & Radios)
- Custom spice level and addon options.
- Active radio/checkbox uses `#E65100` fill with white indicator; unchecked utilizes `#E3DAC9` border.