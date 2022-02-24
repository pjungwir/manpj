To get the full xml for a given time-series:

```
rrdtool dump /var/lib/munin/tal/tal-sensors_temp-temp1-g.rrd
```

There are lots of series in there, starting with shorter with finest resolution, then longer with coarser resolution. Look at `pdp_per_row`. When it's 1, that's the finest resolution (samples 5 minutes apart for munin).

At each resolution there are separate series for `cf` (consolidation function) values of `AVERAGE`, `MIN`, and `MAX`.

To query a series you can say:

```
rrdtool fetch /var/lib/munin/tal/tal-sensors_temp-temp1-g.rrd -s -2h AVERAGE
```

That asks for the average values starting from (`-s`) two hours before now (`-2h`).
The `-s` option also takes a plain int for seconds-since-the-epoch.
