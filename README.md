# docker-pudb
Debug Python code within a Docker container remotely from your terminal using pudb.

## Prerequisites:
- [Python](https://docs.python.org/3/index.html)
- [Docker](https://docs.docker.com/)
- [pudb](https://documen.tician.de/pudb/)
- [telnet client](https://en.wikipedia.org/wiki/Telnet)

## How to do it?
### Python
Just add the following line wherever you want you entry point to be:
```python
from pudb.remote import set_trace; set_trace(term_size=(160, 40), host='0.0.0.0', port=6900)
```
If you wanted to debug using `pudb` locally you'd write instead:
```python
import pudb; pu.db
```
Which is similar to how one would do it for the built-in pdb:
```python
import pdb; pdb.set_trace()
```

### Docker
#### Dockerfile
You need to open the port that `pudb` is listening to. In our example it is 6900.
Just add `EXPOSE 6900` to your Dockerfile.
#### docker-compose
If you use docker-compose yml files the syntax is different. You should add:
```
ports:
    - "6900:6900"
```

## Try it out!
Clone this repository and from its root folder run:
```sh
# Build the image
docker build -t pudb-example .
# Run the container (in the background) with port 6900 open
docker run -p 6900:6900  --detach pudb-example
# Connect to pudb via telnet
telnet 127.0.0.1 6900
# Enjoy debugging!
```

## Acknowledgements
- This repository was inspired by [this blog post](http://kartowicz.com/dryobates/2016-09/debugging_gunicorn_on_docker_with_pudb/). Since there were some instructions but not any code readiliy available to try it out, I built this.