# pg-avalanche
Replicates Postgres to Iceberg


<p align="center">
  <a href="https://github.com/king-technologies/Project-Initiator" title="Project Initiator">
    <img src="https://www.istockphoto.com/photo/tip-of-the-iceberg-gm157509282-10887504?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Ficeberg&utm_term=iceberg%3A%3Asearch-explore-top-affiliate-outside-feed-x-v2%3Acontrol" width="80px" alt="Project Initiator"/>
  </a>
</p>
<h1 align="center">🌟 Data Platform 🌟</h1>
<p align="center">Avalanche 2.0</p>

<p align="center">



## 🦋 Prerequisite

- [Docker](https://www.docker.com/ "Docker") Installed

- [Vault](https://www.vaultproject.io/ "Vault") Installed

## 🛠️ Installation Steps

1. Pull down the Debezium 2 Iceberg Server

```Bash
make pull-iceberg
```

2. Ensure you're under data_eng@dev role

```Bash
role login
role use data_eng@dev
```

3. Build and run the compose. This takes awhile on the first run since we have to build the `builder` image first and its not yet cached

```Bash
make run
```

4. SSH  into the Postgres container and fire whatever commands once logged in

```Bash
docker exec -it <container id> psql -d postgres -U admin
```



### Notes
1. We added permissions to the confluent user to be able to do all operations on an s3 bucket
2. We added in a custom namespace to the `application.properties` so we could leverage `pgoutput` -> `debezium.source.plugin.name=pgoutput`
3. Brian needs to add the `AWS_SECRET_ACCESS_KEY=` and `AWS_ACCESS_KEY=` to vault but his permissions are broken atm so we need to request the values from him atm