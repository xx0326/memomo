# Ubuntu 14.04��Trusty Tahr���ɿ��������򣩷��а�
FROM daocloud.io/ubuntu:trusty

# ���ʹ���������Ʒ
MAINTAINER Captain Dao <support@daocloud.io>

# APT �Զ���װ PHP ��ص������������������������ڴ����
RUN apt-get update \
    && apt-get -y install \
        curl \
        wget \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-sqlite \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc \

    # ��������������Ŵ�ɨ�������������ļ��پ����С
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    # ��װ Composer�������� PHP ��������������ϵ�Ĺ���
    # Laravel Symfony ��ʱ�ֵĿ�ܻ�������
    && curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer

# Apache 2 �����ļ���/etc/apache2/apache2.conf
# �� Apache 2 ����һ��Ĭ�Ϸ���������������ʱ������ʾ���˽���.
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \

    # PHP �����ļ���/etc/php5/apache2/php.ini
    # ���� PHP ���� Request ������ύֵ��˳�򣬽���˳������ң��������ֵ���Ǿ�ֵ
    # Ĭ���趨Ϊ EGPCS��ENV/GET/POST/COOKIE/SERVER��
    && sed -i 's/variables_order.*/variables_order = "EGPCS"/g' \
        /etc/php5/apache2/php.ini

# ����Ĭ�Ϸ��� App ��Ŀ¼
RUN mkdir -p /app && rm -rf /var/www/html && ln -s /app /var/www/html
COPY . /app
WORKDIR /app
RUN chmod 755 ./start.sh

EXPOSE 80
CMD ["./start.sh"]