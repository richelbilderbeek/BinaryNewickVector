#include "binarynewickvector.h"


#include <algorithm>
#include <cassert>
#include <deque>
#include <iostream>
#include <functional>
#include <map>
#include <numeric>
#include <stdexcept>
#include <string>
#include <sstream>
#include <vector>

#include <boost/numeric/conversion/cast.hpp>

#include <boost/lexical_cast.hpp>

#include "BigIntegerLibrary.hh"
#include "newick.h"

#include <fstream>
#include <iostream>
#include <boost/test/unit_test.hpp>

// Boost.Test does not play well with -Weffc++
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Weffc++"

using namespace ribi;

BOOST_AUTO_TEST_CASE(test_binary_newick_vector)
{
  //Check that well-formed Newicks are confirmed valid
  {
    const auto v = newick::CreateValidNewicks();
    for(const auto& s: v)
    {
      //Check if valid newicks (as std::string) are marked as valid
      try
      {
        newick::CheckNewick(s);
      }
      catch (std::exception& e)
      {
        std::cerr << "(" << __FILE__ << "," << __LINE__ << ") "
          << s << ": " << e.what() << '\n';
      }
      //Check if valid newicks (as std::vector) are marked as valid
      try
      {
        const std::vector<int> n = newick::StringToNewick(s);
        newick::CheckNewick(n);
        BOOST_CHECK(newick::IsNewick(n));
      }
      catch (std::exception& e)
      {
        std::cerr << s
          << " (converted to std::vector<int>): "
          << e.what();
      }
      //Check std::string conversion (from BinaryNewickVector(std::string))
      if ( !newick::IsUnaryNewick(newick::StringToNewick(s))
        && !newick::IsBinaryNewick(newick::StringToNewick(s)))
      {
        continue;
      }
      try
      {
        BinaryNewickVector temp(s);
        BOOST_CHECK(s == temp.ToStr());
      }
      catch (std::exception& e)
      {
        std::cerr << s
          << " (BinaryNewickVector from std::string): "
          << e.what();
      }
      //Check std::string conversion (from BinaryNewickVector(std::vector<int>))
      try
      {
        const std::vector<int> n = newick::StringToNewick(s);
        BinaryNewickVector temp(n);
        BOOST_CHECK(s == temp.ToStr());
      }
      catch (std::exception& e)
      {
        std::cerr << s
          << " (BinaryNewickVector from std::vector<int>): "
          << e.what();
      }
      BOOST_CHECK(newick::IsNewick(s));
      //Check the simpler Newicks
      {
        const std::vector<std::vector<int> > simpler
          = newick::GetSimplerBinaryNewicks(
            newick::StringToNewick(s));
        for(const std::vector<int> simple: simpler)
        {
          BOOST_CHECK(newick::IsNewick(simple));
          newick::CheckNewick(simple);
        }
      }
      //Check the branches, only of binary Newicks
      if (newick::IsBinaryNewick(newick::StringToNewick(s)))
      {
        const std::pair<std::vector<int>,std::vector<int> > b
            = newick::GetRootBranchesBinary(newick::StringToNewick(s));
        BOOST_CHECK(newick::IsNewick(b.first));
        BOOST_CHECK(newick::IsNewick(b.second));
      }
    }
  }
}
#pragma GCC diagnostic pop
