#!/bin/sh
args=$@
if [ $CONF_FILE ]
then
  args="--conf $CONF_FILE $args"
fi
if [ $HTML_DIR ]
then
  args="--html $HTML_DIR $args"
fi
if [ $LOG_FILE ]
then
  args="--log $LOG_FILE $args"
fi
if [ $TMDBAPI_KEY ]
then
  sed -i "s/TMDBapi=\"\";/TMDBapi=\"$TMDBAPI_KEY\";/g" $CONF_FILE
fi
echo TMDB API Key = $TMDBAPI_KEY
echo Using args $args
cat $CONF_FILE
exec cmyflix $args
