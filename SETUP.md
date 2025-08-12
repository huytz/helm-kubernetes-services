# Setup Guide for Helm Chart Repository

This guide will help you set up your Helm chart repository using GitHub Pages and the chart-releaser tool.

## Prerequisites

1. A GitHub repository with your Helm charts
2. GitHub Actions enabled on your repository
3. A custom domain (optional, but recommended)

## Step 1: Repository Structure

Your repository should have the following structure:

```
your-repo/
├── charts/
│   └── your-chart/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
├── .github/workflows/
│   └── release.yml
├── .cr.yaml
├── CNAME (if using custom domain)
└── README.md
```

## Step 2: Configure GitHub Pages

1. Go to your repository settings on GitHub
2. Navigate to "Pages" in the left sidebar
3. Under "Source", select "GitHub Actions"
4. This will allow the chart-releaser to automatically deploy to GitHub Pages

## Step 3: Custom Domain (Optional)

If you want to use a custom domain:

1. Add a `CNAME` file to your repository root with your domain:
   ```
   charts.yourdomain.com
   ```

2. Configure your DNS provider to point your domain to GitHub Pages:
   - Add a CNAME record pointing to `yourusername.github.io`
   - Or add A records pointing to GitHub Pages IP addresses

## Step 4: Update Configuration

Update the `.cr.yaml` file with your repository details:

```yaml
owner: your-github-username
git-repo: your-repo-name
package-path: .cr-release-packages
index-path: .cr-index/index.yaml
pages-branch: gh-pages
pages-index-path: index.yaml
release-name-template: "{{ .Name }}-{{ .Version }}"
skip-existing: true
```

## Step 5: Test Your Setup

1. Make a change to one of your charts
2. Commit and push to trigger the GitHub Actions workflow
3. Check the Actions tab to ensure the workflow completes successfully
4. Visit your GitHub Pages URL to see the repository index

## Step 6: Use Your Repository

Once set up, users can add your repository:

```bash
helm repo add yourname https://charts.yourdomain.com
helm repo update
helm install my-app yourname/your-chart
```

## Troubleshooting

### Common Issues

1. **Workflow fails with permission errors**
   - Ensure the repository has the correct permissions for GitHub Actions
   - Check that the `GITHUB_TOKEN` secret is available

2. **Charts not appearing in the index**
   - Verify that your Chart.yaml has a valid version
   - Check that the chart packaging step completed successfully

3. **Custom domain not working**
   - Verify DNS settings are correct
   - Check that the CNAME file is in the repository root
   - Wait for DNS propagation (can take up to 24 hours)

### Local Testing

Use the provided script to test your charts locally:

```bash
./scripts/local-test.sh
```

This will:
- Lint all charts
- Test template rendering
- Verify chart structure

## Next Steps

1. Add more charts to your repository
2. Set up automated testing for your charts
3. Add documentation for your charts
4. Consider setting up chart signing for security

## Resources

- [Chart Releaser Documentation](https://github.com/helm/chart-releaser)
- [Helm Chart Repository Guide](https://helm.sh/docs/topics/chart_repository/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
