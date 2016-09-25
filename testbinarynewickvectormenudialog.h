#ifndef TESTBINARYNEWICKVECTORMENUDIALOG_H
#define TESTBINARYNEWICKVECTORMENUDIALOG_H

#include "menudialog.h"

namespace ribi {

///GUI independent TestBinaryNewick menu dialog
struct TestBinaryNewickVectorMenuDialog final : public MenuDialog
{
  TestBinaryNewickVectorMenuDialog();
  About GetAbout() const noexcept override;
  Help GetHelp() const noexcept override;
  std::string GetVersion() const noexcept override;
  std::vector<std::string> GetVersionHistory() const noexcept override;

  private:
  int ExecuteSpecific(const std::vector<std::string>& argv) noexcept override;
};

} //~namespace ribi

#endif // TESTBINARYNEWICKVECTORMENUDIALOG_H
