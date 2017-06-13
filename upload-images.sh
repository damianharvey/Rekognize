for f in *.*
do
        echo "Uploading File $f"
        aws s3 mv $f s3://rekognize-faces
        aws rekognition index-faces --collection-id faces-collection --image '{"S3Object":{"Bucket":"rekognize-faces","Name":"'$f'"}}' --external-image-id $f
done