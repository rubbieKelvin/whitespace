#include "includes/xtorage.h"
#include <QString>
#include <QFile>
#include <QDebug>
#include <QUrl>
#include <QDir>
#include <iostream>
#include <string>
#include "includes/cxxlib.h"

Xtorage::Xtorage(QObject *parent) : QObject(parent){
    qDebug() << "application data directory:" << root;
    // if directory doesnt exist create it
    if (! QDir(root).exists()){
        QDir().mkdir(root);
    }
}

QString Xtorage::getFilename(){
    return filename;
}

qint64 Xtorage::getKey(){
    return key;
}

QString Xtorage::read(){
    QString filepath {root + "/" + filename};

    QFile file(filepath);
    QString result {""};

    // open the file
    if(!file.exists()) {
        qWarning() << "Does not exits: " << filename;
    }else if(file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream stream(&file);
        result = stream.readAll();
    }

    // decrypt the file content
    if (result.size() != 0){
        std::string decoded = cxx::decode(result.toStdString(), key);
        result = QString::fromStdString(decoded);
    }

    return result;
}

void Xtorage::write(QString data){
    qDebug() << "writing to file...";

    QString filepath {root + "/" + filename};
    QFile file(filepath);

    if(file.open(QIODevice::WriteOnly)) {
        qDebug() << "opened " << file.fileName() ;

        QTextStream stream(&file);

        // encode data
        std::string encoded = cxx::encode(data.toStdString(), key);

        stream << QString::fromStdString(encoded);
        file.close();

        emit textChanged(data);
    }else{
        qDebug() << "could not open file";
    }
}
