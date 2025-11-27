# Contributing to terraform-azure-naming

Thank you for your interest in contributing to the `Build5Nines/naming/azure` Terraform module! We welcome contributions from the community.

## How to Contribute

### Reporting Issues

- Use the [GitHub Issues](https://github.com/Build5Nines/terraform-azure-naming/issues) page to report bugs or request features
- Search existing issues first to avoid duplicates
- Provide clear reproduction steps, expected vs. actual behavior, and your environment details (Terraform version, provider versions, etc.)

### Proposing Changes

1. **Fork the Repository**  
   Fork the repo to your own GitHub account

2. **Create a Branch**  
   Use descriptive branch names:
   - `feature/add-region-abbreviation`
   - `bugfix/fix-location-validation`
   - `docs/improve-readme`

3. **Make Your Changes**  
   - Follow existing code style and conventions
   - Keep changes focused and atomic (one logical change per PR)
   - Test your changes locally with `terraform plan` and `terraform apply`

4. **Update Documentation**  
   If your changes affect usage:
   - Update `README.md` with new examples or input/output descriptions, if necessary
   - Add inline comments for complex logic
   - Update `data/region_abbr.json` or `data/region_pair.json` if adding/updating Azure region support

5. **Write or Update Tests**  
   - Add test cases in `terraform.tftest.hcl` if applicable
   - Run existing tests: `terraform test`
   - Ensure all tests pass before submitting

6. **Commit Your Changes**  
   Use clear, concise commit messages:
   ```
   feat: add abbreviation for Norway East region
   fix: correct location_secondary output for westus3
   docs: clarify name_prefix vs name_suffix usage
   ```

7. **Push to Your Fork**  
   ```bash
   git push origin feature/your-branch-name
   ```

8. **Open a Pull Request**  
   - Navigate to the original repository
   - Click "New Pull Request"
   - Provide a clear description:
     - What problem does this solve?
     - What changes were made?
     - Any breaking changes or migration notes?
   - Reference related issues with `Fixes #123` or `Closes #456`

9. **Respond to Feedback**  
   - Be open to suggestions and review comments
   - Make requested changes promptly
   - Keep the conversation respectful and constructive

## Development Guidelines

### Code Style

- Use consistent indentation (2 spaces for HCL)
- Follow [Terraform style conventions](https://developer.hashicorp.com/terraform/language/syntax/style)
- Use `terraform fmt` to format your code before committing

### Adding Region Support

To add a new Azure region:

1. Update `data/region_abbr.json` or `data/region_pair.json` accordingly

2. Update the region validation in `variables.tf` if needed

4. Test with both display name and programmatic name:
   ```hcl
   location = "New Region"     # display name
   location = "newregion"      # programmatic name
   ```

### JSON File Conventions

- Keep keys in lowercase canonical form (e.g., `eastus`, not `East US`)
- Maintain alphabetical order for easier diffs
- Use compact formatting (no extra whitespace)
- Validate JSON syntax before committing

### Testing

Run tests locally before submitting:

```bash
# Format check
terraform fmt -check

# Validate configuration
terraform init
terraform validate

# Run test suite
terraform test
```

## What We're Looking For

We especially welcome contributions in these areas:

- **New region support**: Adding abbreviations and pairing for newly announced Azure regions
- **Bug fixes**: Addressing issues with location validation, abbreviation lookups, or output generation
- **Documentation improvements**: Clarifying usage, adding examples, fixing typos
- **Test coverage**: Expanding `terraform.tftest.hcl` with edge cases and validation scenarios

## What to Avoid

- Breaking changes without discussion (open an issue first)
- Reformatting large sections of code unrelated to your change
- Adding dependencies without clear justification
- Changes that deviate from the module's core purpose (opinionated Azure resource naming)

## Code of Conduct

This project adheres to a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior.

## Security

If you discover a security issue, please do not open a public issue. Instead, report it privately via our [Security Policy](SECURITY.md).

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (see [LICENSE](LICENSE)).

## Questions?

If you have questions about contributing:
- Open a [GitHub Discussion](https://github.com/Build5Nines/terraform-azure-naming/discussions)
- Comment on a relevant issue
- Reach out via email (see [README](README.md) for contact info)

Thank you for helping make this module better! 🎉
