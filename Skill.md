---
name: frontend-design
description: Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications (examples include websites, landing pages, dashboards, React components, flutter/CSS layouts, or when styling/beautifying any web UI). Generates creative, polished code and UI design that avoids generic AI aesthetics.
license: Complete terms in LICENSE.txt
---

This skill guides creation of distinctive, production-grade frontend interfaces that avoid generic "AI slop" aesthetics. Implement real working code with exceptional attention to aesthetic details and creative choices.

The user provides frontend requirements: a component, page, application, or interface to build. They may include context about the purpose, audience, or technical constraints.

## Design Thinking

Before coding, understand the context and commit to a BOLD aesthetic direction:

- **Purpose**: What problem does this interface solve? Who uses it?
- **Tone**: Pick an extreme: brutally minimal, maximalist chaos, retro-futuristic, organic/natural, luxury/refined, playful/toy-like, editorial/magazine, brutalist/raw, art deco/geometric, soft/pastel, industrial/utilitarian, etc. There are so many flavors to choose from. Use these for inspiration but design one that is true to the aesthetic direction.
- **Constraints**: Technical requirements (framework, performance, accessibility).
- **Differentiation**: What makes this UNFORGETTABLE? What's the one thing someone will remember?

**CRITICAL**: Choose a clear conceptual direction and execute it with precision. Bold maximalism and refined minimalism both work - the key is intentionality, not intensity.

Then implement working code (flutter/CSS/JS, React, Vue, etc.) that is:

- Production-grade and functional
- Visually striking and memorable
- Cohesive with a clear aesthetic point-of-view
- Meticulously refined in every detail

## Frontend Aesthetics Guidelines

Focus on:

- **Typography**: Choose fonts that are beautiful, unique, and interesting. Avoid generic fonts like Arial and Inter; opt instead for distinctive choices that elevate the frontend's aesthetics; unexpected, characterful font choices. Pair a distinctive display font with a refined body font.
- **Color & Theme**: Commit to a cohesive aesthetic. Use CSS variables for consistency. Dominant colors with sharp accents outperform timid, evenly-distributed palettes.
- **Motion**: Use animations for effects and micro-interactions. Prioritize CSS-only solutions for flutter. Use Motion library for React when available. Focus on high-impact moments: one well-orchestrated page load with staggered reveals (animation-delay) creates more delight than scattered micro-interactions. Use scroll-triggering and hover states that surprise.
- **Spatial Composition**: Unexpected layouts. Asymmetry. Overlap. Diagonal flow. Grid-breaking elements. Generous negative space OR controlled density.
- **Backgrounds & Visual Details**: Create atmosphere and depth rather than defaulting to solid colors. Add contextual effects and textures that match the overall aesthetic. Apply creative forms like gradient meshes, noise textures, geometric patterns, layered transparencies, dramatic shadows, decorative borders, custom cursors, and grain overlays.

NEVER use generic AI-generated aesthetics like overused font families (Inter, Roboto, Arial, system fonts), cliched color schemes (particularly purple gradients on white backgrounds), predictable layouts and component patterns, and cookie-cutter design that lacks context-specific character.

Interpret creatively and make unexpected choices that feel genuinely designed for the context. No design should be the same. Vary between light and dark themes, different fonts, different aesthetics. NEVER converge on common choices (Space Grotesk, for example) across generations.

**IMPORTANT**: Match implementation complexity to the aesthetic vision. Maximalist designs need elaborate code with extensive animations and effects. Minimalist or refined designs need restraint, precision, and careful attention to spacing, typography, and subtle details. Elegance comes from executing the vision well.

Remember: Claude is capable of extraordinary creative work. Don't hold back, show what can truly be created when thinking outside the box and committing fully to a distinctive vision.

**Stack UI:** Flutter + `shadcn_ui` (mariuti.com)

**Architecture des tokens:**

- `AppTheme` — source unique de vérité. Contient `lightTheme`, `darkTheme`, les couleurs sémantiques, la typographie, et les thèmes de composants.
- `SabitouColors` — constantes de marque pures (amber accent, success, warning, shimmer) qui n'ont pas d'équivalent dans `ShadColorScheme`.
- `SabitouColorSchemeX` — extension sur `ShadColorScheme` pour accéder aux couleurs custom via `cs.brandAccent`, `cs.brandSuccessSoft`, etc.
- `_T` — classe locale allégée, uniquement pour les rayons de bordure et les couleurs de shimmer skeleton. Tout le reste vient de `ShadTheme.of(context)`.

**Palette lumière:**

| Rôle             | Valeur                     |
| ---------------- | -------------------------- |
| Background       | `#F5F4F2` — warm off-white |
| Surface / Card   | `#FFFFFF` / `#FCFCFD`      |
| Primary (navy)   | `#1C1F36`                  |
| Foreground       | `#1C1F36`                  |
| Muted foreground | `#6B7080`                  |
| Border           | `#E8E6E1`                  |
| Brand accent     | `#F4A826` amber            |
| Success          | `#10B981`                  |
| Destructive      | `#E53E3E`                  |

**Typographie:** Inter, échelle compacte — `h2=20px`, `h3=16px`, `p=14px`, `small/muted=12px`.

**Rayons:** `radiusSm=8` (cards ShadCard), `radius=12`, `radiusLg=20` (hero), `radiusXl=28` (desktop hero).

**Composants shadcn utilisés:** `ShadCard`, `ShadButton` (primary / ghost / outline), `ShadSeparator`, `ShadAlert`, `ShadBadge`, `ShadTheme.of(context).textTheme.*`, `LucideIcons`.

---

## Prompt maître — à réutiliser pour chaque nouvelle page

```
You are building a screen for "Sabitou", a Flutter inventory management app
targeting the Cameroonian market (XAF currency, French/English bilingual).

─── TECH STACK ───────────────────────────────────────────────────────────────
- Flutter (mobile + web + desktop)
- UI library: shadcn_ui (https://mariuti.com/flutter-shadcn-ui/)
  LucideIcons is re-exported by shadcn_ui — no extra icon package needed.
- State: [your state management here — Provider.]
- Navigation: GoRouter

─── DESIGN SYSTEM ────────────────────────────────────────────────────────────
All colors come from ShadTheme.of(context).colorScheme.*
Never hardcode colors that have a semantic slot. Reference this mapping:

  Page background      → colorScheme.background       (#F5F4F2 warm off-white)
  Card surface         → colorScheme.card              (#FCFCFD)
  Primary text         → colorScheme.foreground        (#1C1F36 deep navy)
  Secondary text       → colorScheme.mutedForeground   (#6B7080)
  Border               → colorScheme.border            (#E8E6E1)
  Primary action color → colorScheme.primary           (#1C1F36)
  Destructive / error  → colorScheme.destructive       (#E53E3E)
  Error soft bg        → colorScheme.destructive.withValues(alpha:0.08)
  Amber brand accent   → _T.accent                     (#F4A826)
  Amber soft bg        → _T.accentSoft                 (#FFF3D6)
  Success              → colorScheme.brandSuccess      (#10B981)
  Success soft bg      → colorScheme.brandSuccessSoft  (#ECFDF5)
  Warning              → colorScheme.brandWarning      (#F59E0B)

Shimmer skeleton only:
  shimmerBase          → _T.shimmerBase    (#EDEBE7)
  shimmerHighlight     → _T.shimmerHighlight (#FAF9F7)

─── COMPONENTS — USE shadcn_ui, never raw Flutter widgets for these ──────────
  Card          → ShadCard(padding: EdgeInsets.all(20), child: ...)
  Divider       → ShadSeparator.horizontal()
  Primary CTA   → ShadButton(onPressed: ..., leading: Icon(LucideIcons.xxx), child: Text('...'))
  Secondary CTA → ShadButton.outline(...)
  Ghost / link  → ShadButton.ghost(...)
  Danger action → ShadButton.destructive(...)
  Badge / chip  → ShadBadge(...) / ShadBadge.secondary(...) / ShadBadge.outline(...)
  Alert         → ShadAlert(icon: Icon(LucideIcons.xxx), title: Text('...'), description: Text('...'))
  Alert danger  → ShadAlert.destructive(...)
  Icon          → LucideIcons.<name> (always size 16–22px in Icon widget)
```

## Résumé du système de design Sabitou

**Stack UI:** Flutter + `shadcn_ui` (mariuti.com)

**Architecture des tokens:**

- `AppTheme` — source unique de vérité. Contient `lightTheme`, `darkTheme`, les couleurs sémantiques, la typographie, et les thèmes de composants.
- `SabitouColors` — constantes de marque pures (amber accent, success, warning, shimmer) qui n'ont pas d'équivalent dans `ShadColorScheme`.
- `SabitouColorSchemeX` — extension sur `ShadColorScheme` pour accéder aux couleurs custom via `cs.brandAccent`, `cs.brandSuccessSoft`, etc.
- `_T` — classe locale allégée, uniquement pour les rayons de bordure et les couleurs de shimmer skeleton. Tout le reste vient de `ShadTheme.of(context)`.

**Palette lumière:**

| Rôle             | Valeur                     |
| ---------------- | -------------------------- |
| Background       | `#F5F4F2` — warm off-white |
| Surface / Card   | `#FFFFFF` / `#FCFCFD`      |
| Primary (navy)   | `#1C1F36`                  |
| Foreground       | `#1C1F36`                  |
| Muted foreground | `#6B7080`                  |
| Border           | `#E8E6E1`                  |
| Brand accent     | `#F4A826` amber            |
| Success          | `#10B981`                  |
| Destructive      | `#E53E3E`                  |

**Typographie:** Inter, échelle compacte — `h2=20px`, `h3=16px`, `p=14px`, `small/muted=12px`.

**Rayons:** `radiusSm=8` (cards ShadCard), `radius=12`, `radiusLg=20` (hero), `radiusXl=28` (desktop hero).

**Composants shadcn utilisés:** `ShadCard`, `ShadButton` (primary / ghost / outline), `ShadSeparator`, `ShadAlert`, `ShadBadge`, `ShadTheme.of(context).textTheme.*`, `LucideIcons`.
