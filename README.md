# Deb Pkg Unautostart

Debian packages like to auto start processes during install, with default
configurations, generally not even close to the desired configuration.
That's annoying. Lets make it less annoying.

## Usage

Add to your run list, or include in a recipe, or how ever else you feel
like getting a recipe compiled and converged:

```ruby
run_list("recipe[deb_pkg_unautostart]")
```

There's even an option to get this dropped during the compile phase in
cases where you can't get to the start of the run list, or you have packages
that are being installed during the compile phase.

```ruby
override_attributes(
  :deb_pkg_unautostart => {
    :compiletime => true
  }
)
```

# Info
* Repository: https://github.com/hw-cookbooks/deb_pkg_unautostart
* IRC: Freenode @ #heavywater