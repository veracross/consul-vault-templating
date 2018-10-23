# Consul Template and Consult Demo

The purpose of this repository is to serve as a baseline demonstration of templating configuration out from Consul and Vault, using [Consul Template](https://github.com/hashicorp/consul-template) and [Consult](https://github.com/veracross/consult).

## Getting Started

Make sure you have [Docker CE](https://store.docker.com/search?offering=community&type=edition) installed. Then, clone this repo and do the following:

```bash
$ docker-compose build
$ docker-compose up
```

This will boot three containers, one for Vault, one for Consul, and one basic Ubuntu container to execute commands against Consul and Vault. The latest version of each container will be pulled. Run `docker-compose ps` to see your running containers.

## Accessing Consul

* From your machine: The Consul API and UI are at <http://localhost:8500>
* From the Ubuntu container: The Consul API is available at <http://consul:8500>

## Accessing Vault

The Vault root token is set to `11111111-2222-3333-4444-555555555555`.

* From your machine: The Vault API and UI are available at <http://localhost:8200>.
* From the Ubuntu container: The Vault API is available at <http://vault:8200>

## Prepare some data

Access the Ubuntu container and store some data in Consul and Vault.

```bash
$ docker exec -it consul-vault-templating_ubuntu_1 /bin/bash
$ vault kv put secret/launch_codes password=h4v3-1-b33n-pwned
$ consul kv put hello veracross
```

Now you are ready to template this data out.

## Consul Template

A functioning example of Consul Template is in the `consul-template` directory.

Relevant files:

* `consul-template/demo-template.yml.tmpl`

To try it:

```
$ cd /demo/consul-template
$ consul-template -template "demo-template.yml.tmpl:demo-template.yml:cat demo-template.yml" -vault-renew-token=false
```

## Consult

Consult is a ruby library, somewhat similar to Consul Template.

Relevant files:

* `config/consult.yml`
* `render.rb`

To try it:

```
$ cd /demo
$ bundle install
$ ./render.rb
```
