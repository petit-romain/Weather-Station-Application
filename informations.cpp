#include "informations.h"

Informations::Informations()
{

}

QVariant Informations::getCurrentDate() const
{
    QDateTime currentDate = QDateTime::currentDateTime();

    QString currentDay = currentDate.toString("dddd");
    currentDay = currentDay.replace(0, 1, currentDay.at(0).toUpper());

    QString currentMonth = currentDate.toString("MMMM");
    currentMonth = currentMonth.replace(0, 1, currentMonth.at(0).toUpper());

    QString returnedCurrentDate = currentDay + " " + currentDate.toString("dd") + " " + currentMonth + " " + currentDate.toString("yyyy");

    return QVariant(returnedCurrentDate);
}
