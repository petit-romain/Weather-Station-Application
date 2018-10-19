#include "request.h"

Request::Request()
{
    this->m_informations = new Informations();

    this->m_urlRpiServer = "https://jsonplaceholder.typicode.com/todos/1";
    this->m_urlSunsetSunriseAPI = "https://api.sunrise-sunset.org/json?lat=44.8262553&lng=-0.5786752";

    this->m_manager = new QNetworkAccessManager(this);

    this->m_request= new QNetworkRequest();
    this->m_request->setUrl(this->m_urlSunsetSunriseAPI);

    this->m_timerRequest = new QTimer(this);
    this->m_timerRequest->setInterval(7000);
    this->m_timerRequest->start();

    connect(this->m_manager, &QNetworkAccessManager::finished, this, &Request::replyFinished);

    connect(this->m_timerRequest, &QTimer::timeout, this, &Request::onTimeoutRequest);

    Q_EMIT this->onTimeoutRequest();
}

void Request::processingSunriseSunset(QByteArray _jsonData)
{
    QJsonDocument jsonDocument = QJsonDocument::fromJson(_jsonData);
    QJsonObject jsonObject = jsonDocument.object();
    QVariantMap variantMap = jsonObject.toVariantMap();

    QVariantMap::iterator iteResults = variantMap.find("results");
    QHash<QString, QVariant> allResults = iteResults.value().toHash();

    QVariant sunriseValue = allResults.find("sunrise").value();
    QTime sunriseTime = QTime::fromString(sunriseValue.toString(), "h:mm:ss AP");

    QVariant sunsetValue = allResults.find("sunset").value();
    QTime sunsetTime = QTime::fromString(sunsetValue.toString(), "h:mm:ss AP");

    this->m_informations->setCurrentSunset(sunsetTime.toString("hh:mm"));
    this->m_informations->setCurrentSunrise(sunriseTime.toString("hh:mm"));

    Q_EMIT this->m_informations->informationsChanged();
}

void Request::processingInformations(QByteArray _jsonData)
{
    /*QFile jsonDataFile("../01_Project/Data/data.json");
    jsonDataFile.open(QIODevice::WriteOnly);
    jsonDataFile.write(_jsonData);
    jsonDataFile.close();*/

    QFile jsonDataFile("../01_Project/Data/data.json");
    jsonDataFile.open(QIODevice::ReadOnly);
    QByteArray jsonData = jsonDataFile.readAll();
    jsonDataFile.close();

    QJsonDocument jsonDocument = QJsonDocument::fromJson(jsonData);
    QJsonObject jsonObject = jsonDocument.object();
    QVariantMap variantMap = jsonObject.toVariantMap();

    this->m_informations->setWindVelocities(variantMap.value("windvelocities").toList());
    this->m_informations->setTemperatures(variantMap.value("temperatures").toList());
    this->m_informations->setHumidities(variantMap.value("humidities").toList());
    this->m_informations->setPressures(variantMap.value("pressures").toList());
    this->m_informations->setClimates(variantMap.value("climates").toList());
    this->m_informations->setRainFallHour(jsonObject.value("rainfallhour").toDouble());
    this->m_informations->setRainFallDay(jsonObject.value("rainfallday").toDouble());
    this->m_informations->setOutdoorTemperature(jsonObject.value("outdoortemp").toDouble());
    this->m_informations->setWindDirection(jsonObject.value("winddirection").toDouble());

    Q_EMIT this->m_informations->informationsChanged();
}

void Request::replyFinished(QNetworkReply * _networkReply)
{
    if(_networkReply->url() == this->m_urlRpiServer)
        this->processingInformations(_networkReply->readAll());
    else if (_networkReply->url() == this->m_urlSunsetSunriseAPI)
        this->processingSunriseSunset(_networkReply->readAll());
}

void Request::onTimeoutRequest()
{
    this->m_request->setUrl(this->m_urlSunsetSunriseAPI);    
    this->m_reply = this->m_manager->get(*this->m_request);

    this->m_request->setUrl(this->m_urlRpiServer);
    this->m_reply = this->m_manager->get(*this->m_request);
}
