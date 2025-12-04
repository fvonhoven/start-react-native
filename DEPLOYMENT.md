# Deployment Guide

This guide covers deploying the Start React Native landing page to various hosting platforms.

## 📋 Pre-Deployment Checklist

- [ ] Update all URLs to production domain
- [ ] Test all download links
- [ ] Verify OS detection works correctly
- [ ] Test on mobile devices
- [ ] Run production build: `npm run build`
- [ ] Test production build locally: `npm run preview`

## 🚀 Deployment Options

### Option 1: Vercel (Recommended)

Vercel offers the easiest deployment with automatic builds and previews.

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Deploy**
   ```bash
   vercel
   ```

3. **Follow the prompts:**
   - Set up and deploy: Yes
   - Which scope: Your account
   - Link to existing project: No
   - Project name: start-react-native
   - Directory: ./
   - Override settings: No

4. **Production deployment**
   ```bash
   vercel --prod
   ```

**Custom Domain:**
- Go to Vercel dashboard
- Select your project
- Settings → Domains
- Add `startreactnative.com`

### Option 2: Netlify

1. **Build the project**
   ```bash
   npm run build
   ```

2. **Deploy via Netlify CLI**
   ```bash
   npm install -g netlify-cli
   netlify deploy
   ```

3. **Or drag and drop:**
   - Go to [netlify.com](https://netlify.com)
   - Drag the `dist/` folder to the deploy area

4. **Configure build settings:**
   - Build command: `npm run build`
   - Publish directory: `dist`

**Custom Domain:**
- Domain settings → Add custom domain
- Follow DNS configuration instructions

### Option 3: GitHub Pages

1. **Install gh-pages**
   ```bash
   npm install -D gh-pages
   ```

2. **Add to package.json:**
   ```json
   {
     "scripts": {
       "predeploy": "npm run build",
       "deploy": "gh-pages -d dist"
     },
     "homepage": "https://yourusername.github.io/start-react-native"
   }
   ```

3. **Update vite.config.js:**
   ```javascript
   export default defineConfig({
     base: '/start-react-native/',
     plugins: [react()],
   })
   ```

4. **Deploy**
   ```bash
   npm run deploy
   ```

5. **Enable GitHub Pages:**
   - Repository Settings → Pages
   - Source: gh-pages branch

### Option 4: Cloudflare Pages

1. **Build the project**
   ```bash
   npm run build
   ```

2. **Deploy via Cloudflare Dashboard:**
   - Go to Cloudflare Pages
   - Create a project
   - Connect your Git repository
   - Build settings:
     - Build command: `npm run build`
     - Build output directory: `dist`

3. **Or use Wrangler CLI:**
   ```bash
   npm install -g wrangler
   wrangler pages deploy dist
   ```

### Option 5: AWS S3 + CloudFront

1. **Build the project**
   ```bash
   npm run build
   ```

2. **Create S3 bucket:**
   - Enable static website hosting
   - Upload `dist/` contents

3. **Configure CloudFront:**
   - Create distribution
   - Origin: Your S3 bucket
   - Default root object: `index.html`

4. **Set up custom domain:**
   - Add CNAME record in Route 53
   - Configure SSL certificate

## 🔧 Environment Variables

If you need environment variables:

1. **Create `.env` file:**
   ```
   VITE_API_URL=https://api.example.com
   VITE_ANALYTICS_ID=UA-XXXXXXXXX-X
   ```

2. **Access in code:**
   ```javascript
   const apiUrl = import.meta.env.VITE_API_URL;
   ```

3. **Configure in hosting platform:**
   - Vercel: Settings → Environment Variables
   - Netlify: Site settings → Build & deploy → Environment
   - Cloudflare: Settings → Environment variables

## 📊 Analytics Setup

### Google Analytics

1. **Add to `index.html`:**
   ```html
   <!-- Google Analytics -->
   <script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
   <script>
     window.dataLayer = window.dataLayer || [];
     function gtag(){dataLayer.push(arguments);}
     gtag('js', new Date());
     gtag('config', 'GA_MEASUREMENT_ID');
   </script>
   ```

### Plausible Analytics (Privacy-friendly)

1. **Add to `index.html`:**
   ```html
   <script defer data-domain="startreactnative.com" src="https://plausible.io/js/script.js"></script>
   ```

## 🔒 Security Headers

Add these headers in your hosting platform:

```
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
Referrer-Policy: strict-origin-when-cross-origin
Permissions-Policy: geolocation=(), microphone=(), camera=()
```

**Netlify** - Create `netlify.toml`:
```toml
[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"
```

**Vercel** - Create `vercel.json`:
```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        }
      ]
    }
  ]
}
```

## 🎯 Performance Optimization

1. **Enable compression** (usually automatic on hosting platforms)

2. **Configure caching:**
   - HTML: No cache or short cache
   - CSS/JS: Long cache (hashed filenames)
   - Images: Long cache

3. **Add CDN** (Cloudflare, Fastly, etc.)

4. **Optimize images:**
   ```bash
   npm install -D vite-plugin-imagemin
   ```

## 🧪 Testing Production Build Locally

```bash
npm run build
npm run preview
```

Visit `http://localhost:4173` to test the production build.

## 📱 Progressive Web App (Optional)

To make it a PWA:

1. **Install plugin:**
   ```bash
   npm install -D vite-plugin-pwa
   ```

2. **Configure in `vite.config.js`:**
   ```javascript
   import { VitePWA } from 'vite-plugin-pwa'
   
   export default defineConfig({
     plugins: [
       react(),
       VitePWA({
         registerType: 'autoUpdate',
         manifest: {
           name: 'Start React Native',
           short_name: 'StartRN',
           description: 'Automated React Native setup',
           theme_color: '#6366f1',
         }
       })
     ],
   })
   ```

## 🔄 Continuous Deployment

Most platforms support automatic deployments:

- **Vercel/Netlify:** Automatically deploy on git push
- **GitHub Pages:** Use GitHub Actions
- **Cloudflare Pages:** Connect repository for auto-deploy

## 📞 Support

If you encounter issues:
- Check build logs in your hosting platform
- Verify all environment variables are set
- Test locally with `npm run preview`
- Check browser console for errors

---

**Happy deploying! 🚀**

