# NOTE: This script can be modified for different atomic structures, 
# units, etc. See in.elastic for more info.
#

# Define the finite deformation size. Try several values of this
# variable to verify that results do not depend on it.
variable up equal 1.0e-5
 
# Define the amount of random jiggle for atoms
# This prevents atoms from staying on saddle points
variable atomjiggle equal 1.0e-6

# metal units, elastic constants in GPa
units		metal
variable cfac equal 1.0e-4
variable cunits string GPa

# Define minimization parameters
variable etol equal 0.0 
variable ftol equal 1.0e-12
variable maxiter equal 1000
variable maxeval equal 1000
variable dmax equal 1.0e-2

# generate the box and atom positions using a diamond lattice
# variable a equal 5.43

boundary	p p p

lattice     fcc 4.609
region		simbox prism -1.0 1.0 -1.0 1.0 -1.0 1.0 0.0 0.0 0.0
create_box	2 simbox
lattice 		fcc 4.609  orient x 1 0 0 orient y 0 1 0 orient z 0 0 1
create_atoms	1 region simbox
lattice 		fcc 4.609  origin 0 0 0.5 orient x 1 0 0 orient y 0 1 0 orient z 0 0 1
create_atoms	2 region simbox
dump DUMPFILE all xyz 1 dump.xyz

# Need to set mass to something, just to satisfy LAMMPS
mass 1 91.224
mass 2 14.007

