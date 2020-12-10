#ifndef MYCUSTOMPOINTCLOUD_H
#define MYCUSTOMPOINTCLOUD_H

#include <QtQuick3D/QQuick3DGeometry>
#include <QVector3D>

class MyCustomPointCloud : public QQuick3DGeometry
{
    Q_OBJECT

    Q_PROPERTY(int count READ getCount WRITE setCount NOTIFY countChanged)
public:
    MyCustomPointCloud();

    int getCount() const;
    void setCount(int value);

signals:
    void countChanged(int count);

private:
    void updateGeometry();
    QVector3D generateRandomVertex(float min, float max) const;

    int m_count = 1;
};

#endif // MYCUSTOMPOINTCLOUD_H
