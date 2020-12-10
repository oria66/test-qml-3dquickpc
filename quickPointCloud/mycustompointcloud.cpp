#include "mycustompointcloud.h"
#include <QRandomGenerator>

MyCustomPointCloud::MyCustomPointCloud()
{
    updateGeometry();
}

int MyCustomPointCloud::getCount() const
{
    return m_count;
}

void MyCustomPointCloud::setCount(int value)
{
    if(m_count == value) return;

    m_count = value;
    updateGeometry();
    emit countChanged(m_count);
}

void MyCustomPointCloud::updateGeometry()
{
    clear();

    QByteArray vertexData;
    vertexData.resize(sizeof(float) * 3 * m_count);
    float *p = reinterpret_cast<float *>(vertexData.data());

    for (int var = 0; var < m_count; ++var)
    {
        const QVector3D vertex = generateRandomVertex(-300.0f, 300.0f);
        *p++ = vertex.x();
        *p++ = vertex.y();
        *p++ = vertex.z();
    }

    setVertexData(vertexData);
    setPrimitiveType(QQuick3DGeometry::PrimitiveType::Points);
    setStride(3 * sizeof(float));
    addAttribute(QQuick3DGeometry::Attribute::PositionSemantic,
                 0,
                 QQuick3DGeometry::Attribute::F32Type);
}

QVector3D MyCustomPointCloud::generateRandomVertex(float min, float max) const
{
    float v1 = QRandomGenerator::global()->generateDouble() * (max - min) + min;
    float v2 = QRandomGenerator::global()->generateDouble() * (max - min) + min;
    float v3 = QRandomGenerator::global()->generateDouble() * (max - min) + min;

    return QVector3D(v1, v2, v3);
}
