# Spatium-API

Spatium is an API that aims to storage software builds that evolve over time. The main funcionalities include Amazon's AWS S3 integration, automatic build tagging and two different levels of hierarchy among builds (development builds and master/stable builds).

Storaging the builds enables the application of continuous deploy on desktop applications, since it is possible to check if the current version is the latest and, if necessary, download it.

Spatium's development had, as first motivation, [Reabilitação Motora's](https://github.com/fga-gpp-mds/2018.1-Reabilitacao-Motora) need for continuous deploy. Reabilitação Motora is an Unity3D application that required continuous deploy on its development process. Combining the storage API with a [Launcher](https://github.com/fga-gpp-mds/2018.1-Reabilitacao-Motora-Launcher) made the continuous deploy pipeline come to life.

File uploads can be made with curl or any uploader that supports MultiPart form wrapping.
