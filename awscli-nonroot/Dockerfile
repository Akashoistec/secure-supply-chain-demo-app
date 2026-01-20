FROM public.ecr.aws/aws-cli/aws-cli:2.15.57

# Create non-root user and group
RUN groupadd -g 10001 app && \
    useradd -u 10001 -g 10001 -m -s /sbin/nologin app

USER 10001
WORKDIR /home/app

ENTRYPOINT ["aws"]

