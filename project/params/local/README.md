## Global parameters in local machine and different running env

Something could be differently when you run Handow in different environments, e.g., the file paths, target app URLs, special behaviors in localhost running... Normally we can define dedicated data for different scenarios to fix this issue. The _**./local**_ is used to contain parameters for localhost running.

The properties defined in local params files will be added to current global parameters, and they will **override** the properties defined by nono-local params files with same names. The local parameters are only for local machine running, not uploaded to shared repository or instances running in other environments. (For example, user should edit the .gitignore file to exclude the _./local_ folder form remote repository).

Similar with the  _**./local**_ folder, user can define more dedicated parameter directories to support various running environments.