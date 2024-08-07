Run command in existing container:

```
docker exec -ti container-name-or-id /bin/bash
docker exec -ti -u root container-name-or-id /bin/bash
```

View the `Dockerfile` of an image:

First pull the image, then view  its history:

```
docker pull bitnami/odoo:17.0.20240705-debian-12-r0
docker history bitnami/odoo:17.0.20240705-debian-12-r0
```

If you are dealing with a Dockerfile flattened by crane, this works pretty well:

```
docker history bitnami/odoo:17.0.20240705-debian-12-r0 | perl -lane 'print "@F[6..$#F]"' | jq -C .
# or
docker history bitnami/odoo:17.0.20240705-debian-12-r0 | perl -lane 'print "@F[6..$#F]"' | jq -r '.[].created_by'
```
