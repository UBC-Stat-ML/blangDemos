Summary
-------

<!-- [![Build Status](https://travis-ci.org/alexandrebouchard/blangDemos.png?branch=master)](https://travis-ci.org/alexandrebouchard/blangDemos) -->




Installation
------------


There are several options available to install the package:

### From the command line

- Check out the source ``git clone https://github.com/UBC-Stat-ML/blangDemos.git``
- Compile using ``./gradlew installDist``
- Add the directory ``build/install/blangDemos/bin`` to your ``$PATH`` variable.

### Integrate to a gradle script

Simply add the following lines (replacing 1.0.0 by the current version (see git tags)):

```groovy
repositories {
 mavenCentral()
 jcenter()
 maven {
    url "https://www.stat.ubc.ca/~bouchard/maven/"
  }
}

dependencies {
  compile group: 'ca.ubc.stat', name: 'blangDemos', version: '1.0.0'
}
```

### Compile using the provided gradle script

- Check out the source ``git clone git@github.com:alexandrebouchard/blangDemos.git``
- Compile using ``./gradlew installDist``
- Add the jars in ``build/install/blangDemos/lib/`` into your classpath

### Use in eclipse

- Check out the source ``git clone git@github.com:alexandrebouchard/blangDemos.git``
- Type ``./gradlew eclipse`` from the root of the repository
- From eclipse:
  - ``Import`` in ``File`` menu
  - ``Import existing projects into workspace``
  - Select the root
  - Deselect ``Copy projects into workspace`` to avoid having duplicates


