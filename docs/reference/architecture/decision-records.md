# Decision records

These are the records of design decisions for future reference in order to understand why things are the way they are.
They are not permanent; they can and will change in the future if better alternatives become available.

??? Template

    ## Description of the the change

    ### Context

    TODO

    ### Decision

    TODO

    ### Consequences

    - TODO

## Choosing the base OS

### Context

In the past, I've used Ubuntu Server for everything from baremetal to container images, but I'm increasingly getting fed up with Canonical's shit.
The Fedora project seems to have thier ducks in a row and I like that it transitions nicely to RHEL.  

For context, here is [khuedoan](https://homelab.khuedoan.com/reference/architecture/decision-records/#choosing-the-base-os)'s decision context on the matter:

> I've tried several distributions, and each has advantages and disadvantages.
> Fedora has a good (enough) balance between stability and new features.
>
> Alternatives considered:
>
> - Fedora CoreOS (moved to Rocky in `7667254`):
>   - Pros: automatic and atomic upgrade, immutable, quick installation
>   - Cons: hard to run Ansible on (Python is not included)
> - CentOS/Rocky Linux (moved to Fedora in `022b816`):
>   - Pros: relatively stable (however we did encounter a breaking change [#63](https://github.com/khuedoan/homelab/issues/63), still not sure why)
>   - Cons: kernel and packages are too old
> - Debian: couldn't get it to work with PXE boot and Rocky Linux was sufficient so I didn't push any further
> - Cluster API (previous attempt in `a8e4a85`, I hope to get this to work someday):
>   - Pros: control bare metal machines via Kubernetes API, open the possibility for autoscaling and autohealing
>   - Cons: doesn't support simple WoL and shutdown via SSH (or similar)

### Decision

Use Fedora as the base OS.

### Consequences

`¯\_(ツ)_/¯`
