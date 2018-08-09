# coursier benchmark

This small project fetches `org.apache.spark::spark-sql:2.2.0` with and without
sbt-coursier, and compares both results.

## Run it

```
$ ./run.sh
```

## Warning

This "benchmark" is only worth what's it's worth. Lots of IO (network,
disk) is involved. There's no consideration of JVM warm up.

## Results

### Coursier

#### Cache empty

`update`: 17 s

`updateClassifiers`: 34 s

#### Cache full

`update`: 3 s

`updateClassifiers`: 1 s

### SBT/Ivy

#### Cache empty

`update`: 41 s

`updateClassifiers`: 45 s

#### Cache full

`update`: 7 s

`updateClassifiers`: 7 s
