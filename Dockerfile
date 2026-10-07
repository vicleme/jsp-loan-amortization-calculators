FROM tomcat:9.0-jre17-temurin

# Deploy the exploded web app under /Proj01_Amortizacao (there is no Java source to compile)
COPY Proj01_Amortizacao/web/ /usr/local/tomcat/webapps/Proj01_Amortizacao/

# Redirect the site root to the app
RUN mkdir -p /usr/local/tomcat/webapps/ROOT \
 && printf '<!DOCTYPE html><meta http-equiv="refresh" content="0; url=/Proj01_Amortizacao/"><title>Redirecting</title>' \
    > /usr/local/tomcat/webapps/ROOT/index.html

# Keep memory low for small hosts such as Render's free plan
ENV JAVA_OPTS="-Xmx256m -XX:+UseSerialGC"

EXPOSE 8080
CMD ["catalina.sh", "run"]
