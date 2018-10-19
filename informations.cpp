#include "informations.h"

Informations::Informations()
{

    this->m_timerDate = new QTimer(this);
    this->m_timerDate->start(1000);

    connect(this->m_timerDate, &QTimer::timeout, this, &Informations::onTimeoutDate);
}

QList<QVariant> Informations::getCurrentWeek() const
{
    QList<QVariant> returnedCurrentWeek;
    QLocale locale(QLocale::English);
    QDate currentDate = QDate::currentDate();
    QString processing;

    for(signed char i = -6; i < 0; i++) {
        processing = locale.toString(currentDate.addDays(i), "ddd");
        processing.remove(3, 1);
        processing.replace(0, 1, processing.at(0).toUpper());
        returnedCurrentWeek << QVariant(processing);
    }

    processing = locale.toString(currentDate ,"ddd");
    processing.remove(3, 1);
    processing.replace(0, 1, processing.at(0).toUpper());
    returnedCurrentWeek << QVariant(processing);

    return returnedCurrentWeek;
}

QVariant Informations::getCurrentDate() const
{    
    QDate currentDate = QDate::currentDate();
    QLocale locale(QLocale::English);

    QString currentDay = locale.toString(currentDate, "dddd");
    currentDay = currentDay.replace(0, 1, currentDay.at(0).toUpper());

    QString currentMonth = locale.toString(currentDate, "MMMM");
    currentMonth = currentMonth.replace(0, 1, currentMonth.at(0).toUpper());

    QString returnedCurrentDate = currentDay + ' ' + currentDate.toString("dd") + ' ' + currentMonth + ' ' + currentDate.toString("yyyy");

    return QVariant(returnedCurrentDate);
}

QVariant Informations::getCurrentTime() const
{
    QTime currentTime = QTime::currentTime();

    return QVariant(currentTime.toString("HH:mm"));
}

void Informations::onTimeoutDate()
{
    this->getCurrentDate();
    this->getCurrentTime();

    Q_EMIT this->currentDateTimeChanged();
}
