using ASEconvert

ase.io.write("Si_diamond.extxyz", ase.build.bulk("Si", "diamond"; a=5.46))
ase.io.write("GaAs_b3.extxyz", ase.build.bulk("GaAs", "zincblende"; a=5.75))
