#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "mana-machine" ? 0 : 1;
}
