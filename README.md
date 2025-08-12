# Helm Kubernetes Services

[![Release Charts](https://github.com/huytz/helm-kubernetes-services/workflows/Release%20Charts/badge.svg)](https://github.com/huytz/helm-kubernetes-services/actions)

This repository contains Helm Charts for deploying your applications on Kubernetes clusters with [Helm](https://helm.sh/).

## Charts

| Chart | Version | Description |
|-------|---------|-------------|
| [k8s-service](./charts/k8s-service) | ![Version](https://img.shields.io/github/v/release/huytz/helm-kubernetes-services?label=k8s-service) | A Helm chart to package your application container for Kubernetes |

## Usage

### Add the repository

```bash
helm repo add huytz https://charts.huytran.dev
helm repo update
```

### Install a chart

```bash
# Install k8s-service chart
helm install my-app huytz/k8s-service
```

### Upgrade a chart

```bash
helm upgrade my-app huytz/k8s-service
```

## Features

* Deploy your application containers on to Kubernetes
* Zero-downtime rolling deployments
* Auto scaling and auto healing
* Configuration management and Secrets management
* Ingress and Service endpoints

## Documentation

* [Core Concepts](./core-concepts.md) - Learn about Kubernetes and Helm basics
* [Examples](./examples/) - Working examples of how to use the charts
* [Contributing](./CONTRIBUTING.md) - How to contribute to this project

## Repository Structure

```
.
├── charts/                    # Helm charts
│   └── k8s-service/          # Main Kubernetes service chart
├── examples/                  # Example configurations
├── _docs/                     # Documentation assets
├── .github/workflows/         # GitHub Actions workflows
├── .cr.yaml                   # Chart-releaser configuration
└── index.yaml                 # Helm repository index (auto-generated)
```

## Development

### Local Development

1. Clone the repository
2. Make changes to charts
3. Test locally with `helm install --dry-run`
4. Commit and push to trigger automatic release

### Adding New Charts

1. Create a new directory in `charts/`
2. Add your Chart.yaml and templates
3. Update the workflow to include your chart
4. Push to trigger release

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, please open an issue on GitHub or contact the maintainers.
