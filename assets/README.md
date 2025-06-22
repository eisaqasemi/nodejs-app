# Assets Directory

This directory contains all static assets for the Project Manager application including styles, images, fonts, icons, and uploads.

## Directory Structure

```
assets/
├── images/          # Image files (logos, icons, backgrounds, etc.)
├── styles/          # CSS files (main styles, components, etc.)
├── fonts/           # Custom font files
├── icons/           # Icon files (SVG, PNG)
├── uploads/         # User-uploaded files
└── README.md        # This file
```

## File Organization

### Images (`/images/`)
- **logos/** - Application logos and branding
- **icons/** - Custom icons and small graphics
- **backgrounds/** - Background images and patterns
- **avatars/** - User profile pictures
- **screenshots/** - Application screenshots

### Styles (`/styles/`)
- **main.css** - Global styles and utilities
- **components.css** - Component-specific styles
- **responsive.css** - Responsive design styles
- **themes.css** - Theme variations

### Fonts (`/fonts/`)
- Custom font files in various formats (WOFF2, WOFF, TTF, OTF)
- Font loading strategies and fallbacks

### Icons (`/icons/`)
- SVG icons for better scalability
- PNG icons for fallback support
- Icon sprite sheets for performance

### Uploads (`/uploads/`)
- User-uploaded project files
- Temporary file storage
- Organized by user and project

## Accessing Assets

### Direct Access
Assets are served directly from the `/assets` endpoint:

```
http://localhost:5000/assets/styles/main.css
http://localhost:5000/assets/images/logo.png
http://localhost:5000/assets/fonts/custom-font.woff2
```

### API Access
Assets can also be accessed through the API with additional features:

```
http://localhost:5000/api/assets/styles/main.css
http://localhost:5000/api/assets/images/logo.png
http://localhost:5000/api/assets/list
```

## Usage Examples

### In HTML
```html
<!-- CSS -->
<link rel="stylesheet" href="/assets/styles/main.css">
<link rel="stylesheet" href="/assets/styles/components.css">

<!-- Images -->
<img src="/assets/images/logo.png" alt="Logo">
<img src="/assets/images/icons/project.svg" alt="Project Icon">

<!-- Fonts -->
<link rel="preload" href="/assets/fonts/roboto.woff2" as="font" type="font/woff2" crossorigin>
```

### In CSS
```css
/* Background images */
.hero-section {
  background-image: url('/assets/images/backgrounds/hero.jpg');
}

/* Font faces */
@font-face {
  font-family: 'CustomFont';
  src: url('/assets/fonts/custom-font.woff2') format('woff2');
}
```

### In JavaScript/React
```javascript
// Import images
import logo from '/assets/images/logo.png';
import projectIcon from '/assets/images/icons/project.svg';

// Use in components
<img src={logo} alt="Logo" />
<img src={projectIcon} alt="Project" />

// Dynamic loading
const backgroundStyle = {
  backgroundImage: 'url(/assets/images/backgrounds/pattern.svg)'
};
```

## Asset Optimization

### Images
- Use appropriate formats (PNG for transparency, JPG for photos, SVG for icons)
- Compress images to reduce file size
- Consider responsive images with multiple sizes
- Use WebP with fallbacks for better compression

### CSS
- Minify CSS files for production
- Use CSS custom properties for theming
- Implement critical CSS loading
- Consider CSS-in-JS for component-specific styles

### Fonts
- Use WOFF2 format for modern browsers
- Implement font loading strategies
- Subset fonts to include only needed characters
- Use `font-display: swap` for better performance

## Caching Strategy

### Static Assets
- CSS files: 24 hours cache
- Images: 1 year cache
- Fonts: 1 year cache with CORS headers

### Uploads
- User uploads are not cached
- Temporary files are cleaned up automatically

## Security Considerations

### File Uploads
- Validate file types and sizes
- Scan for malicious content
- Store uploads outside web root when possible
- Implement proper access controls

### Asset Serving
- Set appropriate CORS headers
- Use content-type headers
- Implement rate limiting for API access
- Validate file paths to prevent directory traversal

## Development Workflow

### Adding New Assets
1. Place files in appropriate subdirectory
2. Follow naming conventions (kebab-case)
3. Optimize files for web use
4. Update documentation if needed

### Testing Assets
```bash
# List available assets
curl http://localhost:5000/api/assets/list

# Test asset serving
curl -I http://localhost:5000/assets/styles/main.css
```

### Build Process
- Assets are copied to production build
- CSS is minified and optimized
- Images are compressed
- Fonts are subset and optimized

## Performance Tips

1. **Use CDN** for production assets
2. **Implement lazy loading** for images
3. **Use sprite sheets** for multiple small icons
4. **Preload critical assets** in HTML head
5. **Compress and optimize** all files
6. **Use appropriate cache headers**
7. **Consider using WebP** with fallbacks

## Troubleshooting

### Common Issues
- **404 errors**: Check file paths and permissions
- **CORS errors**: Ensure proper headers are set
- **Slow loading**: Optimize file sizes and use CDN
- **Font not loading**: Check font-display and preloading

### Debug Tools
- Browser developer tools for network analysis
- Asset listing API: `/api/assets/list`
- Server logs for access patterns 