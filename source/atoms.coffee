# Globals
Atoms = @Atoms =
  version   : "0.07.15"
  Core      : {}
  Class     : {}

  Atom      : {}
  Molecule  : {}
  Organism  : {}
  Entity    : {}
  # DOM Handler Facade
  $: (args...) -> if $$? then $$ args... else $ args...
