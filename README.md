# OpenRefine

- Source code: https://github.com/OpenRefine/OpenRefine
- Documentation: https://openrefine.org/

## Container image build

- Dockerfile: https://github.com/vvvggg/openrefine/blob/main/Dockerfile
- Exposed WEB UI: **TCP 3333**
- Data Volume: **/data**

### CHANGELOG

- Fixed some UI HTML images `src` to respect base URL path, if any
- Fixed the ENTRYPOINT script `grep` invocation parameter for cleaner logs

