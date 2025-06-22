# Fonts Directory

This directory contains custom fonts for the Project Manager application.

## Font Formats

Include multiple formats for cross-browser compatibility:

- **WOFF2** - Modern browsers (smallest file size)
- **WOFF** - Older browsers
- **TTF/OTF** - Fallback for very old browsers

## Font Loading

### CSS @font-face Declaration

```css
@font-face {
  font-family: 'CustomFont';
  src: url('/assets/fonts/custom-font.woff2') format('woff2'),
       url('/assets/fonts/custom-font.woff') format('woff'),
       url('/assets/fonts/custom-font.ttf') format('truetype');
  font-weight: normal;
  font-style: normal;
  font-display: swap;
}
```

### Usage in CSS

```css
body {
  font-family: 'CustomFont', 'Roboto', sans-serif;
}
```

## Font Optimization

1. **Subset fonts** to include only needed characters
2. **Use font-display: swap** for better performance
3. **Preload critical fonts** in HTML head
4. **Compress font files** to reduce size

## Preloading Critical Fonts

```html
<link rel="preload" href="/assets/fonts/custom-font.woff2" as="font" type="font/woff2" crossorigin>
```

## Font Loading Strategy

```css
/* Font loading fallback */
.font-loading {
  font-family: 'System Font', sans-serif;
}

.font-loaded {
  font-family: 'CustomFont', 'System Font', sans-serif;
}
```

## JavaScript Font Loading

```javascript
// Check if font is loaded
document.fonts.ready.then(() => {
  document.body.classList.add('fonts-loaded');
});

// Load specific font
const font = new FontFace('CustomFont', 'url(/assets/fonts/custom-font.woff2)');
font.load().then(() => {
  document.fonts.add(font);
});
```

## Recommended Fonts

For web applications, consider these free fonts:

- **Roboto** - Clean, modern sans-serif
- **Open Sans** - Highly readable
- **Lato** - Friendly and professional
- **Source Sans Pro** - Adobe's open-source font
- **Inter** - Modern, highly legible

## File Naming Convention

Use descriptive names:
- `roboto-regular.woff2`
- `roboto-bold.woff2`
- `roboto-italic.woff2`

## Performance Considerations

- **Limit font variants** to what you actually use
- **Use system fonts** as fallbacks
- **Consider variable fonts** for multiple weights/styles
- **Implement font loading strategies** to prevent layout shifts 