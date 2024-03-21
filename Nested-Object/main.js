function getValueFromNestedObject(object, key) {
    const keys = key.split('/');
    let value = object;

    for (const k of keys) {

        if (value && typeof value === 'object' && k in value) {
            value = value[k];
        } else {

            return undefined;
        }
    }

    return value;
}


module.exports = getValueFromNestedObject;