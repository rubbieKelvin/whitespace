#ifndef XTORAGE_H
#define XTORAGE_H

#include <QObject>
#include <QString>
#include <QStandardPaths>


class Xtorage : public QObject{
    Q_OBJECT
    Q_PROPERTY(QString filename READ getFilename)
    Q_PROPERTY(qint64 key READ getKey)
    Q_PROPERTY(QString text READ read WRITE write NOTIFY textChanged)

public:
	explicit Xtorage(QObject *parent = nullptr);
    QString filename {".cxx"};
    QString root {QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)};
    qint64 key;
    QString getFilename();
    qint64 getKey();
    QString read();
    void write(QString);

signals:
    void textChanged(QString);

};

#endif // XTORAGE_H
