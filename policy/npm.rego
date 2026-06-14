package npm.security

deny[msg] {
  package := input.packages[_]

  published := time.parse_rfc3339_ns(package.published_at)
  now := time.now_ns()

  age_ns := now - published
  min_age_ns := 48 * 60 * 60 * 1000000000

  age_ns < min_age_ns

  msg := sprintf(
    "npm package %q version %q is too new; packages must be at least 2 days old",
    [package.name, package.version]
  )
}