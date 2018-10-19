#ifndef INFORMATIONS_H
#define INFORMATIONS_H

#include <QObject>
#include <QTimer>
#include <QList>
#include <QDateTime>
#include <QLocale>
#include <QDebug>

class Informations : public QObject
{
    Q_OBJECT
    Q_ENUMS(Weather)
    Q_PROPERTY(QList<QVariant> windVelocities   READ getWindVelocities      NOTIFY informationsChanged)
    Q_PROPERTY(QList<QVariant> rainFalls        READ getRainFalls           NOTIFY informationsChanged)
    Q_PROPERTY(QList<QVariant> temperatures     READ getTemperatures        NOTIFY informationsChanged)
    Q_PROPERTY(QList<QVariant> humidities       READ getHumidities          NOTIFY informationsChanged)
    Q_PROPERTY(QList<QVariant> pressures        READ getPressures           NOTIFY informationsChanged)
    Q_PROPERTY(QList<QVariant> climates         READ getClimates            NOTIFY informationsChanged)
    Q_PROPERTY(QList<QVariant> currentWeek      READ getCurrentWeek         NOTIFY informationsChanged)
    Q_PROPERTY(QVariant currentDate             READ getCurrentDate         NOTIFY currentDateTimeChanged)
    Q_PROPERTY(QVariant currentTime             READ getCurrentTime         NOTIFY currentDateTimeChanged)
    Q_PROPERTY(QVariant currentSunrise          READ getCurrentSunrise      NOTIFY informationsChanged)
    Q_PROPERTY(QVariant currentSunset           READ getCurrentSunset       NOTIFY informationsChanged)
    Q_PROPERTY(QVariant rainFallHour            READ getRainFallHour        NOTIFY informationsChanged)
    Q_PROPERTY(QVariant rainFallDay             READ getRainFallDay         NOTIFY informationsChanged)
    Q_PROPERTY(QVariant outdoorTemperature      READ getOutdoorTemperature  NOTIFY informationsChanged)

private:
    QList<QVariant> m_windVelocities, m_rainFalls, m_temperatures, m_humidities, m_pressures, m_climates;
    QTimer * m_timerDate;
    QVariant m_currentDate, m_currentSunrise, m_currentSunset, m_rainFallHour, m_rainFallDay, m_outdoorTemperature, m_windDirection;

public:
    Informations();

    QList<QVariant> getCurrentWeek() const;
    QVariant getCurrentDate() const;
    QVariant getCurrentTime() const;

    QVariant getCurrentSunrise() const { return this->m_currentSunrise; }
    void setCurrentSunrise(QString _currentSunrise) { this->m_currentSunrise = QVariant(_currentSunrise); }

    QVariant getCurrentSunset() const { return this->m_currentSunset; }
    void setCurrentSunset(QString _currentSunset) { this->m_currentSunset = QVariant(_currentSunset); }

    QVariant getRainFallHour() const { return this->m_rainFallHour; }
    void setRainFallHour(double _rainFallHour) { this->m_rainFallHour = QVariant(_rainFallHour); }

    QVariant getRainFallDay() const { return this->m_rainFallDay; }
    void setRainFallDay(double _rainFallDay) { this->m_rainFallDay = QVariant(_rainFallDay); };

    QVariant getOutdoorTemperature() const { return this->m_outdoorTemperature; }
    void setOutdoorTemperature(double _outdoorTemp) { this->m_outdoorTemperature = QVariant(_outdoorTemp); }

    QList<QVariant> getWindVelocities() const { return this->m_windVelocities; }
    void setWindVelocities(QList<QVariant> _windVelocities) { this->m_windVelocities = _windVelocities; };

    QList<QVariant> getRainFalls() const { return this->m_rainFalls; }
    void setRainFalls(QList<QVariant> _rainFalls) { this->m_rainFalls = _rainFalls; }

    QList<QVariant> getTemperatures() const { return this->m_temperatures; }
    void setTemperatures(QList<QVariant> _temperatures) { this->m_temperatures = _temperatures; }

    QList<QVariant> getHumidities() const { return this->m_humidities; }
    void setHumidities(QList<QVariant> _humidities) { this->m_humidities = _humidities; }

    QList<QVariant> getPressures() const { return this->m_pressures; }
    void setPressures(QList<QVariant> _pressures) { this->m_pressures = _pressures; }

    QList<QVariant> getClimates() const { return this->m_climates; }
    void setClimates(QList<QVariant> _climates) { this->m_climates = _climates; }

public slots:
    Q_SLOT void onTimeoutDate();

signals:
    Q_SIGNAL void informationsChanged();
    Q_SIGNAL void currentDateTimeChanged();
};

#endif // INFORMATIONS_H
