# Openconnect+Ocproxy

This docker image helps you to setup a [openconnect client](http://www.infradead.org/openconnect/) (version 8.05-r0 currently with pulse/juniper support)  and provide a socks5 proxy port via [ocproxy](https://github.com/cernekee/ocproxy/) (version 1.60).

I made this image for the inconvenience of the VPN provided by my university. 

I hate it that all traffic would be taken by the VPN rather than proxy when needed.

# Using a `.env` file

You can make a `.env` file instead of setting the environment variables on CLI:

    URL=<Gateway URL>
    USER=<Username>
    PASSWORD=<Password>
    PROTOCOL=<VPN Protocol, Optional>

# Run container

To run a container for test:

    docker run -it --rm --privileged --env-file=<Env File> -p <Host Port>:1080 reochen/openconnect-proxy

If anything runs okay and you can connect to the VPN by SOCKS5 on \<Host Port\>, now, you can run it in background by:

    docker run -d --name <Container Name> --privileged --env-file=<Env File> -p <Host Port>:1080 reochen/openconnect-proxy

or

    docker run -d --name <Container Name> --privileged -e URL=<Gateway URL> \
    -e USER=<Username> \
    -e PASSWORD=<Password> \
    -e PROTOCOL=<VPN Protocol, Optional> \
    -p <Host Port>:1080 reochen/openconnect-proxy

# Special Thanks

I referred to [afloren/openconnect-socks-proxy](https://hub.docker.com/r/afloren/openconnect-socks-proxy) and [wazum/openconnect-proxy
](https://hub.docker.com/r/wazum/openconnect-proxy) when I made this image. 

I made some simplification to make it convenient to use for myself.

