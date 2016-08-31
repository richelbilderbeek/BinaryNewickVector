#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Weffc++"
#include "qttestbinarynewickvectormenudialog.h"

#include <cassert>

#include "testbinarynewickvectormenudialog.h"
#include "qtaboutdialog.h"
#include "qttestbinarynewickvectormaindialog.h"
#include "ui_qttestbinarynewickvectormenudialog.h"
#pragma GCC diagnostic pop

ribi::QtTestBinaryNewickVectorMenuDialog::QtTestBinaryNewickVectorMenuDialog(QWidget *parent) :
  QtHideAndShowDialog(parent),
  ui(new Ui::QtTestBinaryNewickVectorMenuDialog)
{
  ui->setupUi(this);
}

ribi::QtTestBinaryNewickVectorMenuDialog::~QtTestBinaryNewickVectorMenuDialog() noexcept
{
  delete ui;
}

void ribi::QtTestBinaryNewickVectorMenuDialog::on_button_start_clicked()
{
  QtTestBinaryNewickVectorMainDialog d;
  this->ShowChild(&d);
}

void ribi::QtTestBinaryNewickVectorMenuDialog::on_button_about_clicked()
{
  QtAboutDialog d(TestBinaryNewickVectorMenuDialog().GetAbout());
  this->ShowChild(&d);
}

void ribi::QtTestBinaryNewickVectorMenuDialog::on_button_quit_clicked()
{
  this->close();
}
