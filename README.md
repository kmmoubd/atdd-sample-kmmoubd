# Robot Framework Sample Application

This project is sample for using robotframework with Selenium2Library.

## Preparation

Install Selenium2Library
```
pip install robotframework-seleniumlibrary
```
Please see [robotframework/SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) for more details.

Older library might not work for new firefox.
At that time please run the following command:
```
pip install --upgrade robotframework-seleniumlibrary
```


## Run Example

Start Jetty.
```
mvn jetty:run
```

Run Test

```
robot ./src/test/resources/scenarios/
```

Stop Jetty
```
mvn jetty:stop
```
