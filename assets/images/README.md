# Images Directory

This directory contains all image assets for the Project Manager application.

## Structure

- `logos/` - Application logos and branding images
- `icons/` - Custom icons and small graphics
- `backgrounds/` - Background images and patterns
- `avatars/` - User profile pictures and avatars
- `screenshots/` - Application screenshots for documentation

## Supported Formats

- **PNG** - For images with transparency
- **JPG/JPEG** - For photographs and complex images
- **SVG** - For scalable graphics and icons
- **WebP** - For optimized web images (with fallbacks)

## Naming Convention

Use kebab-case for file names:
- `project-manager-logo.png`
- `user-avatar-default.jpg`
- `dashboard-background.svg`

## Optimization

Before adding images to this directory:

1. **Compress images** to reduce file size
2. **Use appropriate formats** (PNG for transparency, JPG for photos)
3. **Consider responsive images** with multiple sizes
4. **Optimize SVGs** by removing unnecessary metadata

## Usage in Code

```html
<!-- In HTML -->
<img src="/assets/images/logos/logo.png" alt="Project Manager Logo">

<!-- In CSS -->
.background {
  background-image: url('/assets/images/backgrounds/pattern.svg');
}
```

```javascript
// In JavaScript/React
import logo from '/assets/images/logos/logo.png';

// Or use as background
const backgroundStyle = {
  backgroundImage: 'url(/assets/images/backgrounds/hero.jpg)'
};
```

## File Size Guidelines

- **Icons**: < 10KB
- **Logos**: < 50KB
- **Backgrounds**: < 200KB
- **Photos**: < 500KB

## Accessibility

Always include appropriate `alt` text for images:

```html
<img src="/assets/images/icons/project.png" alt="Project icon">
```

For decorative images, use empty alt text:

```html
<img src="/assets/images/backgrounds/pattern.png" alt="">
``` 