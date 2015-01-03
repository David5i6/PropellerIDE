#include <QApplication>
#include <qdebug.h>
#include "mainwindow.h"

#include <QMessageBox>
#include <QStyleFactory>
#include <QTranslator>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qDebug() << "App path:" << app.applicationFilePath();
#if defined(Q_OS_WIN32)
    QStringList styles = QStyleFactory::keys();
    qDebug() << "Available window styles" << styles;
    if(styles.contains("Fusion")) {
        QApplication::setStyle("Fusion");
    }
#endif
//    QTranslator translator;
//    translator.load("propelleride_zn");
//    app.installTranslator(&translator);

    app.setWindowIcon(QIcon(":/icons/PropHatAlpha.png"));
    QCoreApplication::setOrganizationName("Parallax");
    QCoreApplication::setOrganizationDomain("www.parallax.com");
    QCoreApplication::setApplicationName("PropellerIDE");
    MainWindow w;
    w.init();
    if(argc > 1) {
        QString s = QString(argv[1]);
        if(s.contains(QDir::toNativeSeparators(QDir::tempPath())) &&
           s.contains(".zip",Qt::CaseInsensitive)) {
            QMessageBox::critical(&w, w.trUtf8("Cannot Open from Zip"),
                w.trUtf8("The file is in a zipped archive. Unzip to")+"\n"+
                w.trUtf8("a folder first, and open from there instead."));
        }
        else {
            s = s.mid(s.lastIndexOf("."));
            w.openFile(QString(argv[1]));
        }
    }
    w.show();
    return app.exec();
}
