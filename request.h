#ifndef REQUEST_H
#define REQUEST_H

#include <QPointer>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QTimer>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include "informations.h"

class Request : public QObject
{
    Q_OBJECT    
    Q_PROPERTY(Informations * informations  READ getInformations    NOTIFY informationsChanged)

private:
    QString m_urlRpiServer, m_urlSunsetSunriseAPI;
    QNetworkAccessManager * m_manager;
    QNetworkRequest * m_request;
    QNetworkReply * m_reply;
    QTimer * m_timerRequest;
    Informations * m_informations;

public:
    Request();
    void processingSunriseSunset(QByteArray);
    void processingInformations(QByteArray);

    Informations * getInformations() const { return this->m_informations; }

private slots:
    Q_SLOT void replyFinished(QNetworkReply *);
    Q_SLOT void onTimeoutRequest();

signals:
    Q_SIGNAL void informationsChanged();
};

#endif // REQUE.ST_H
